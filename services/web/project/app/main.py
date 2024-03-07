import os

from flask import Blueprint, jsonify, request

from project.app.models import Book
from project import db


bp = Blueprint('main', __name__)


@bp.route('/')
def home():
    return jsonify({'message': 'Welcome to the Bookstore!'})

if __name__ == '__main__':
    app.run()
