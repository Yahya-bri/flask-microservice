#!/bin/sh

echo "Starting Gunicorn..."

gunicorn -b 0.0.0.0:5000 manage:app