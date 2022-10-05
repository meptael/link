<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Alexander Persky Milestone 4 - Twitter</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <main>
        <header>
            <form class="compose">
                <textarea placeholder="Compose new Tweet..."></textarea>

                <div>
                    <span class="count">140</span>
                    <button>Send</button>
                </div>
            </form>
        </header>

        <div class="tweets">
            <div class="thread">
                <div class="tweet">
                    <img src="images/rockit.png">

                    <div class="body">
                        <div class="title">@ROCKIT_BOOTCAMP</div>
                        <div class="message">tweet tweet!!</div>
                    </div>
                </div>

                <div class="replies">
                    <form class="compose">
                        <textarea placeholder="Compose new Tweet..."></textarea>

                        <div>
                            <span class="count">140</span>
                            <button>Send</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="thread">
                <div class="tweet">
                    <img src="images/rockit.png">

                    <div class="body">
                        <div class="title">@ROCKIT_BOOTCAMP</div>
                        <div class="message">Hey who wants to teach?</div>
                    </div>
                </div>

                <div class="replies">
                    <form class="compose">
                        <textarea placeholder="Compose new Tweet..."></textarea>

                        <div>
                            <span class="count">140</span>
                            <button>Send</button>
                        </div>
                    </form>

                    <div class="tweet">
                        <img src="images/brad.png">

                        <div class="body">
                            <div class="title">@bradwestfall</div>
                            <div class="message">I do!</div>
                        </div>
                    </div>

                    <div class="tweet">
                        <img src="images/rockit.png">

                        <div class="body">
                            <div class="title">@ROCKIT_BOOTCAMP</div>
                            <div class="message">sweet!</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Handlebars Templates -->
    <script id="template-tweet" type="text/x-handlebars-template">
       	<div class="tweet">
            <img src="images/{{ img }}">

            <div class="body">
                <div class="title">{{ handle }}</div>
                <div class="message">{{ message }}</div>
            </div>
        </div>
    </script>

    <script id="template-compose" type="text/x-handlebars-template">
        <div class="replies">
            <form class="compose">
                <textarea placeholder="Compose new Tweet..."></textarea>

                <div>
                    <span class="count">140</span>
                    <button>Send</button>
                </div>
            </form>
        </div>
    </script>

    <script id="template-thread" type="text/x-handlebars-template">
        <div class="thread">
            {{{ tweetTemplate }}}
            {{{ composeTemplate }}}
        </div>
    </script>

    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0/handlebars.js"></script>
    <script src="js/main.js"></script>
</body>
</html>