import threading
import bot
import web

if __name__ == "__main__":
    threading.Thread(target=bot.run_bot).start()
    web.run_web()
