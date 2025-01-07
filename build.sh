#!/bin/bash

# Sprawdź czy mamy wszystkie wymagane narzędzia
command -v meson >/dev/null 2>&1 || { echo "Wymagany meson. Instaluję..."; pip install meson; }
command -v ninja >/dev/null 2>&1 || { echo "Wymagany ninja. Instaluję..."; pip install ninja; }
command -v pybind11 >/dev/null 2>&1 || { echo "Wymagany pybind11. Instaluję..."; pip install pybind11; }

# Utwórz i przejdź do katalogu build jeśli nie istnieje
if [ ! -d "build" ]; then
    mkdir build
fi

# Usuń stare pliki build jeśli istnieją
rm -rf build/*

# Konfiguracja i budowanie
cd build
meson setup .. || { echo "Błąd konfiguracji meson"; exit 1; }
ninja || { echo "Błąd kompilacji"; exit 1; }

# Instalacja
ninja install || { echo "Błąd instalacji"; exit 1; }

echo "Budowanie zakończone pomyślnie!"

# Wróć do głównego katalogu
cd ..

# Uruchom testy jeśli istnieją
if [ -d "tests" ]; then
    echo "Uruchamiam testy..."
    python -m pytest tests/
fi