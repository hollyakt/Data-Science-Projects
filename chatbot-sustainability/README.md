# Georgetown Sustainability Chatbot

Small OpenAI-powered chatbot that answers questions about Georgetown University's sustainability efforts, grounded in scraped sustainability content.

## Run

```bash
pip install openai
export OPENAI_API_KEY=sk-...
python chatbot.py
```

The script expects a `sustainability_data.json` file in the same directory — produced by a separate scraping step that is not included in this repo.

## Note

`chatbot.py` currently uses the legacy `openai` 0.x SDK (`openai.ChatCompletion.create`). It will need to be migrated to the 1.x client API to run against current OpenAI accounts. See the [OpenAI Python migration guide](https://github.com/openai/openai-python/discussions/742).
