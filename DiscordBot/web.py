from flask import Flask, render_template, request, redirect, url_for
import bot
import asyncio

app = Flask(__name__)

@app.route("/")
def index():
    guilds = bot.get_guilds_and_channels()
    return render_template("index.html", guilds=guilds)

@app.route("/send", methods=["POST"])
def send():
    channel_id = request.form["channel"]
    title = request.form["title"]
    description = request.form["description"]
    color = request.form["color"]

    coro = bot.send_embed_message(channel_id, title, description, color)

    try:
        future = asyncio.run_coroutine_threadsafe(coro, bot.bot_instance.loop)
        result = future.result(timeout=10)
        print(f"[WEB] Send result: {result}")
    except Exception as e:
        print(f"[WEB ERROR] {e}")
        return "Ошибка при отправке сообщения", 500

    return redirect(url_for("index"))

def run_web():
    app.run(port=5000)
