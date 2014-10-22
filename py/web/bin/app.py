import web
import os

urls = (
  '/hello', 'Index'
)

app = web.application(urls, globals())

render = web.template.render('templates/', base="layout")

class Index(object):
    def GET(self):
        return render.hello_form()

    def POST(self):
        form = web.input()
        print "%s, %s" % (form.server, form.port)
        print "json:", form.json.encode('utf8')
        cmd_output = os.popen("ls -l").read()
        cmd_output.replace("\n", "<br>")
        return render.index(output=cmd_output)

if __name__ == "__main__":
    app.run()