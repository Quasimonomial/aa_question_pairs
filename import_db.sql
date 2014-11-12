CREATE TABLE users(
	id INTEGER PRIMARY KEY,
	fname VARCHAR(255) NOT NULL,
	lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions(
	id INTEGER PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	body TEXT,
	author_id INTEGER NOT NULL,

	FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_followers(
	id INTEGER PRIMARY KEY,
	follower_id INTEGER NOT NULL,
	question_id INTEGER NOT NULL,

	FOREIGN KEY (follower_id) REFERENCES users(id),
	FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
	id INTEGER PRIMARY KEY,
	question_id INTEGER NOT NULL,
	parent_reply INTEGER,
	author_id INTEGER NOT NULL,
	body TEXT NOT NULL,
	
	FOREIGN KEY (question_id) REFERENCES questions(id),
	FOREIGN KEY (parent_reply) REFERENCES replies(id),
	FOREIGN KEY	(author_id) REFERENCES users(id)	
);

CREATE TABLE question_likes(
	id INTEGER PRIMARY KEY,
	question_id INTEGER NOT NULL,
	liker_id INTEGER NOT NULL,

	FOREIGN KEY (question_id) REFERENCES questions(id),
	FOREIGN KEY (liker_id) REFERENCES users(id)
);


-- blantantly stealing this from the solutions, but i need some data
INSERT INTO
users (fname, lname)
VALUES
("Ned", "Ruggeri"), ("Kush", "Patel"), ("Earl", "Cat");

-- Insert seed questions
INSERT INTO
questions (title, body, author_id)
SELECT
"Ned Question", "NED NED NED", users.id
FROM
users
WHERE
users.fname = "Ned" AND users.lname = "Ruggeri";
INSERT INTO
questions (title, body, author_id)
SELECT
"Kush Question", "KUSH KUSH KUSH", users.id
FROM
users
WHERE
users.fname = "Kush" AND users.lname = "Patel";
INSERT INTO
questions (title, body, author_id)
SELECT
"Earl Question", "MEOW MEOW MEOW", users.id
FROM
users
WHERE
users.fname = "Earl" AND users.lname = "Cat";


