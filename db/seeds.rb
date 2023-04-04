# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

question = Question.create(
    question_text: "What is the book Getting Real about?", 
    answer: "Getting Real is a smaller, faster, better way to build 
    software. It focuses on big-picture ideas to help entrepreneurs, 
    designers, programmers, and marketers build successful web apps. 
    It begins with the customer experience and builds backwards, 
    favoring iterations and sensible decision-making over traditional 
    functional specs and paperwork. It's an approach suited to 
    web-based applications, and can be applied to many different 
    types of endeavors."
)

question_2 = Question.create(
    question_text: "How to build and deliver software faster and more efficiently?", 
    answer: "Break up into smaller units. Ship less features, but quality features. 
    Ship it and let the customer tell you if it’s the right thing and if it’s not, 
    fix it and ship it to the web the same day. Don't try to close all open issues 
    before development starts. Refine details during the development phase."
)

question_3 = Question.create(
    question_text: "How to get feedback from end users?", 
    answer: "Release an MVP (minimum viable product) to a select few and talk to them 
    about what is working and what isn't. Develop learning loops with your customers 
    to check in on progress and get feedback. Encourage customers to interact with 
    each other to get further feedback."
)