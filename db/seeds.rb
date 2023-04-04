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
    question_text: "How to deliver a software to customers faster", 
    answer: "Focus on shipping minimal viable products (MVPs) and 
    try to reduce the complexity of your warehouse or cloud setup.
    Start small before scaling, use version control for tracking 
    orders, automate as many processes as possible, and build with 
    customer feedback in mind to iterate quickly."
)