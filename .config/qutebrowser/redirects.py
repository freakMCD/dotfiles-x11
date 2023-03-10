
from qutebrowser.api import interceptor, message
from urllib.parse import urljoin
from PyQt5.QtCore import QUrl
import operator

# Any return value other than a literal 'False' means we redirected
REDIRECT_MAP = {
	"reddit.com": operator.methodcaller('setHost', 'libreddit.domain.glass'),
	"www.reddit.com": operator.methodcaller('setHost', 'libreddit.domain.glass'),
    "old.reddit.com": operator.methodcaller('setHost', 'libreddit.domain.glass'),
	"twitter.com": operator.methodcaller('setHost', 'nitter.snopyta.org'),
	"www.twitter.com": operator.methodcaller('setHost', 'nitter.snopyta.org'),
    "music.youtube.com": operator.methodcaller('setHost', 'hyperpipe.surge.sh'),
    #"youtube.com": operator.methodcaller('setHost', 'invidious.baczek.me'),
    "i.imgur.com": operator.methodcaller('setHost', 'rimgo.pussthecat.org'),
    "imgur.com": operator.methodcaller('setHost', 'rimgo.pussthecat.org'),
    "quora.com": operator.methodcaller('setHost', 'qr.vern.cc'),
}

def int_fn(info: interceptor.Request):
	"""Block the given request if necessary."""
	if (info.resource_type != interceptor.ResourceType.main_frame or
			info.request_url.scheme() in {"data", "blob"}):
		return
	url = info.request_url
	redir = REDIRECT_MAP.get(url.host())
	if redir is not None and redir(url) is not False:
		message.info("Redirecting to " + url.toString())
		info.redirect(url)


interceptor.register(int_fn)
