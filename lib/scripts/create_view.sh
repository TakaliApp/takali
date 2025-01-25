#!/bin/bash

required_folders=(
    "./lib/views/templates"
    "./lib/views"
    "./lib/viewmodels"
    )

required_files=(
    "./lib/views/templates/template_view.dart"
    "./lib/views/templates/template_viewmodel.dart"
    )

if [ $# -ne 1 ]; then
  echo "Error: Please provide the view name as an argument."
  exit 1
fi


for folder in "${required_folders[@]}"; do
  # Check your condition here
  if [[ ! -d "$folder" ]]; then
    echo "Error: '$folder' not found. Make sure you run the script at the root of the project."
  fi
done


for filename in "${required_files[@]}"; do
  # Check your condition here
  if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' not found. Needed for the view generation."
  fi
done

targetFolder=$1
viewFile="$1_view.dart"
viewModelFile="$1_viewmodel.dart"

mkdir "./lib/views/$targetFolder"
cp "./lib/views/templates/template_view.dart" "./lib/views/$targetFolder/$viewFile"
cp "./lib/views/templates/template_viewmodel.dart" "./lib/viewmodels/$viewModelFile"
