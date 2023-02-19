HAI 1.2
    CAN HAS HTTP
    CAN HAS STDIO
    I HAS A REQUEST

    # Listen for incoming requests on port 8080
    HTTP 8080, {
        # When a request is received, parse the request and store it in the REQUEST variable
        GIMMEH REQUEST

        # Determine which page was requested
        I HAS A PAGE ITZ REQUEST["PATH"]

        # Output the appropriate response based on the requested page
        SWITCH PAGE
            CASE "/":
                VISIBLE "HTTP/1.1 200 OK\nContent-Type: text/html\n\n<html><head><title>Hello World</title></head><body><h1>Hello World!</h1></body></html>"
            CASE "/about":
                VISIBLE "HTTP/1.1 200 OK\nContent-Type: text/html\n\n<html><head><title>About Us</title></head><body><h1>About Us</h1><p>We are a simple web framework written in Lolcode.</p></body></html>"
            DEFAULT:
                VISIBLE "HTTP/1.1 404 Not Found\nContent-Type: text/html\n\n<html><head><title>404 Not Found</title></head><body><h1>404 Not Found</h1><p>The requested page was not found.</p></body></html>"
        KTHX
    }

KTHXBYE
