import random
import re
from qutebrowser.api import interceptor
from qutebrowser.extensions.interceptors import RedirectException
from qutebrowser.utils import message

redirects = {
    "youtube": {
        "source": ["youtube.com"],
        "target": [
            "yt.oelrichsgarcia.de",
            "invidious.weblibre.org",
            "invidious.dhusch.de",
            "iv.ggtyler.dev",
            "invidious.baczek.me",
            "yt.funami.tech",
            "iv.melmac.space",
            "invidious.silur.me",
            "inv.riverside.rocks",
            "invidious.lidarshield.cloud",
            "invidious.flokinet.to",
            "invidious.snopyta.org",
            "invidious.kavin.rocks",
            "vid.puffyan.us",
            "yt.artemislena.eu",
            "invidious.nerdvpn.de",
            "invidious.tiekoetter.com",
            "invidious.namazso.eu",
            "inv.vern.cc",
            "yewtu.be",
            "inv.bp.projectsegfau.lt",
            "invidious.epicsite.xyz",
            "y.com.sb",
            "invidious.sethforprivacy.com",
        ],
    },
    
    "twitter": {
        "source": ["twitter.com"],
        "target": [
            "nitter.net",
            "nitter.42l.fr",
            "nitter.fdn.fr",
            "nitter.1d4.us",
            "nitter.kavin.rocks",
            "nitter.unixfox.eu",
            "nitter.namazso.eu",
            "nitter.moomoo.me",
            "bird.trom.tf",
            "nitter.it",
            "twitter.censors.us",
            "nitter.grimneko.de",
            "twitter.076.ne.jp",
            "n.l5.ca",
            "unofficialbird.com",
            "nitter.ungovernable.men",
        ],
    },
    "imdb": {
        "source": ["imdb.com"],
        "target": [
            "libremdb.iket.me",
            "libremdb.pussthecat.org",
            "libremdb.esmailelbob.xyz",
            "ld.vern.cc",
            "binge.whatever.social",
            "libremdb.lunar.icu",
        ],
    },
    "translate": {
        "source": ["translate.google.com"],
        "target": [
            "lingva.ml",
            "translate.igna.wtf",
            "translate.plausibility.cloud",
            "translate.projectsegfau.lt",
            "translate.dr460nf1r3.org",
            "lingva.garudalinux.org",
            "translate.jae.fi",
        ],
    },
    "tiktok": {
        "source": ["tiktok.com"],
        "target": [
            "proxitok.pabloferreiro.es",
            "proxitok.pussthecat.org",
            "tok.habedieeh.re",
            "proxitok.esmailelbob.xyz",
            "proxitok.privacydev.net",
            "proxitok.odyssey346.dev",
            "tok.artemislena.eu",
            "tok.adminforge.de",
            "proxitok.manasiwibi.com",
            "tik.hostux.net",
            "tt.vern.cc",
            "proxitok.mha.fi",
            "proxitok.pufe.org",
            "proxitok.marcopisco.com",
            "cringe.whatever.social",
            "proxitok.lunar.icu",
        ],
    },
    "imgur": {
        "source": ["imgur.com"],
        "target": [
            "rimgo.bcow.xyz",
            "rimgo.pussthecat.org",
            "rimgo.totaldarkness.net",
            "rimgo.esmailelbob.xyz",
            "imgur.artemislena.eu",
            "rimgo.vern.cc",
            "rim.odyssey346.dev",
            "rimgo.privacytools.io",
            "rimgo.hostux.net",
            "ri.zzls.xyz",
            "rimgo.marcopisco.com",
            "rimgo.lunar.icu",
        ],
    },
       
    "wiki-en": {
        "source": ["en.wikipedia.org"],
        "target": [
            "wiki.adminforge.de",
            "wiki.froth.zone",
            "wiki.slipfox.xyz",
            "wikiless.esmailelbob.xyz",
            "wikiless.funami.tech",
            "wikiless.org",
            "wikiless.tiekoetter.com",
        ],
    },
}


def rewrite(request: interceptor.Request):
    if (
        request.resource_type != interceptor.ResourceType.main_frame
        or request.request_url.scheme() in {"data", "blob"}
    ):
        return

    url = request.request_url

    for service in redirects.values():
        matched = False
        for source in service["source"]:
            if re.search(source, url.host()):
                matched = True

        if matched:
            target = service["target"][random.randint(0, len(service["target"]) - 1)]
            if target is not None and url.setHost(target) is not False:
                if "postprocess" in service:
                    service["postprocess"](url)
                try:
                    request.redirect(url)
                except RedirectException as e:
                    message.error(str(e))
                break


interceptor.register(rewrite)
