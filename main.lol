HAI 1.2
    CAN HAS HTTP
    CAN HAS STDIO
    CAN HAS FILE

    # Define a dictionary of HTML templates to use for each path
    I HAS A TEMPLATES ITZ {"": "templates/index.html", "/about": "templates/about.html"}

    # Load each template into memory
    I HAS A TEMPLATE_CONTENTS
    FOR KEY, VALUE IN TEMPLATES
        I HAS A FILE_HANDLE ITZ FILE(VALUE, "r")
        GIMMEH TEMPLATE_CONTENTS[KEY] ITZ FILE_HANDLE.BOTHSAEM READ

    # Listen for incoming requests on port 8080
    HTTP 8080, {
        # When a request is received, parse the request and store it in the REQUEST variable
        GIMMEH REQUEST

        # Determine which page was requested
        I HAS A PAGE ITZ REQUEST["PATH"]

        # If the requested page has a template, output the appropriate response using the template
        I HAS A TEMPLATE ITZ TEMPLATES[PAGE]
        I HAS A TEMPLATE_CONTENT ITZ TEMPLATE_CONTENTS[PAGE]
        I HAS A RESPONSE ITZ TEMPLATE_CONTENT NERF "<% PAGE %>", PAGE

        # Output the appropriate response based on the requested page
        SWITCH PAGE
            CASE "":
                VISIBLE "HTTP/1.1 200 OK\nContent-Type: text/html\n\n" BOTHSAEM RESPONSE
            CASE "/about":
                VISIBLE "HTTP/1.1 200 OK\nContent-Type: text/html\n\n" BOTHSAEM RESPONSE
            DEFAULT:
                VISIBLE "HTTP/1.1 404 Not Found\nContent-Type: text/html\n\n<html><head><title>404 Not Found</title></head><body><h1>404 Not Found</h1><p>The requested page was not found.</p></body></html>"
        KTHX
    }

KTHXBYE
