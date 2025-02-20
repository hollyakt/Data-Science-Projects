
import openai
import json

# Load the scraped data
with open('sustainability_data.json') as f:
	sustainability_data = json.load(f)

# OpenAI API setup
#openai.api_key =  # Add with your actual API key

# Generate response
def generate_response_gpt(user_input):
	# Use OpenAI's ChatCompletion API
	messages = [
		{"role": "system", "content": "You are a smart and conversational chatbot knowledgeable about Georgetown University's sustainability efforts. Use the provided data to answer user queries. If the data doesn't cover the query, suggest visiting the website."},
		{"role": "user", "content": user_input},
	]

	response = openai.ChatCompletion.create(
		model="gpt-3.5-turbo",  # Replace with "gpt-4" for better performance if available
		messages=messages,
		max_tokens=200,
		temperature=0.7
	)
	return response['choices'][0]['message']['content']

# Chatbot function
def chatbot():
	print("Chatbot: Hi! I can help you with questions about Georgetown University's sustainability efforts. Ask me anything!")
	user_input = input("You: ")
	response = generate_response_gpt(user_input)
	print(f"Chatbot: {response}")

chatbot()
