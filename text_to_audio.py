# Reads text from file called text_to_convert.txt
# and converts it to an audio file called audio.mp3

from gtts import gTTS
import os

def create_audio(text_file, output_file):
  with open(text_file, 'r', encoding='utf-8') as file:
    text = file.read()
    
  tts = gTTS(text=text, lang='en')
  tts.save(output_file)
  print(f"Audiobook saved as {output_file}")

text_file = "text_to_convert.txt"
output_file = "audio.mp3"
create_audiobook(text_file, output_file)

os. system(f"start {output_file}")
