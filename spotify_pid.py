def main() -> None:
    f = open("temp", "r")
    index = ""

    for line in f:
        if "index:" in line:
            start = 0
            for ch in line:
                start += 1
                if ch == ':':
                    break
            index = line[start:]
        if "<spotify>" in line:
            break

    print(str(int(index)))


if __name__ == "__main__":
    main()