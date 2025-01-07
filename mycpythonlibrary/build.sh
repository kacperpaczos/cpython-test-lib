#!/bin/bash

# Sprawdź i zainstaluj wymagane pakiety systemowe
if ! dpkg -l | grep -q python3-pybind11; then
    echo "Instaluję python3-pybind11..."
    sudo apt-get update
    sudo apt-get install -y python3-pybind11
fi

# Sprawdź czy mamy pytest i venv
if ! python3 -c "import pytest" 2>/dev/null; then
    echo "Instaluję pytest..."
    sudo apt-get install -y python3-pytest python3-venv
fi

# Utwórz i aktywuj wirtualne środowisko
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# Instaluj wymagane narzędzia w venv
pip install meson ninja pytest pybind11

# Utwórz i przejdź do katalogu build
if [ ! -d "build" ]; then
    mkdir build
fi

# Usuń stare pliki build
rm -rf build/*

# Konfiguracja i budowanie C++
cd build
meson setup .. || { echo "Błąd konfiguracji meson"; exit 1; }
ninja || { echo "Błąd kompilacji"; exit 1; }

# Wróć do głównego katalogu
cd ..

# Instaluj pakiet Python w venv
pip install -e .

# Uruchom testy
python -m pytest tests/

# Dezaktywuj venv
deactivate