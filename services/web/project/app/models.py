import datetime

from flask import current_app
from sqlalchemy.sql import func

from project import db


class Book(db.Model):
    
    __tablename__ = 'books'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(128), nullable=False)
    author = db.Column(db.String(128), nullable=False)
    read = db.Column(db.Boolean(), default=False, nullable=False)
    created_date = db.Column(db.DateTime, default=func.now(), nullable=False)
    updated_date = db.Column(db.DateTime, default=func.now(), onupdate=func.now(), nullable=False)

    def to_json(self):
        return {
            'id': self.id,
            'title': self.title,
            'author': self.author,
            'read': self.read,
            'created_date': self.created_date,
            'updated_date': self.updated_date
        }