import logging

logging.basicConfig(level=logging.INFO, format="%(levelname)s %(message)s")
log = logging.getLogger("yourpkg")   # ← これを入れる

def main():
    log.info("start")
    print("hello from yourpkg")
    log.info("done")

if __name__ == "__main__":
    main()

