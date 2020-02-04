#!/bin/sh

TEMPLATES_DIR=.templates

echo "Preparing repository for development"
echo "Generating .env file"
cp -av "${TEMPLATES_DIR}/dotenv" .env
echo "Activate git repo commit template"
git config commit.template "$(pwd)/.templates/commit.template"
