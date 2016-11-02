CREATE DATABASE trainingTracker;

USE trainingTracker;
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  nick VARCHAR(50) PRIMARY KEY,
  pass VARCHAR(50) NOT NULL ,
  email VARCHAR(50) NOT NULL UNIQUE,
  registerDate DATETIME DEFAULT CURRENT_TIMESTAMP
);
USE trainingTracker;
DROP TABLE IF EXISTS MuscleGroup;
CREATE TABLE MuscleGroup (
  name VARCHAR(50) NOT NULL,
  primary key(name)
);

DROP TABLE IF EXISTS Exercises;
CREATE TABLE Exercises (
  _id INTEGER auto_increment,
  name VARCHAR(50),
  muscle_group VARCHAR(50) NOT NULL,
  predefined BOOL NOT NULL DEFAULT FALSE,
  foreign key(muscle_group) references MuscleGroup(name),
  primary key(_id)
);

DROP TABLE IF EXISTS Own;
CREATE TABLE Own (
    nick VARCHAR(50),
    exercise INTEGER,
    foreign key(nick) references Users(nick),
    foreign key(exercise) references Exercises(_id),
    primary key(nick, exercise)
);


USE trainingTracker;
DROP TABLE IF EXISTS Records;
CREATE TABLE Records (
    exercise INTEGER NOT NULL,
    user_nick VARCHAR(50),
    weigth DOUBLE NOT NULL,
    series INTEGER NOT NULL,
    repetitions INTEGER NOT NULL,
    record_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    foreign key(exercise) references Exercises(_id),
    foreign key(user_nick) references Users(nick),
    primary key(exercise, user_nick, record_date)
);