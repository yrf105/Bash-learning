#!/usr/bin/env bash

foo() {
    bar=1
    echo "bar=$bar"
}

foo

echo "bar=$bar"

widget() {
    local w=5
    echo "w=$w"
}

widget

echo "w=$w"