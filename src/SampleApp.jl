module SampleApp
using Toolips
using Toolips.Components
# extensions
logger = Toolips.Logger()


main = route("/") do c::Connection
    sty = style("div.sample", "background-color" => "red", "width" => 100percent, "height" => 10percent)
    newdiv = div("newdiv", text = "test")
    style!(newdiv, sty)
    anim = keyframes("fadein")
    keyframes!(anim, from, "opacity" => 0percent)
    keyframes!(anim, to, "opacity" => 100percent)
    style!(sty, anim)
    seconddiv = div("newdiv2", text = "test2")
    style!(seconddiv, "transition" => 3s)
    style!(seconddiv, anim)
    write!(c, anim, sty, newdiv, seconddiv)
    upndown = keyframes("updown", iterations = 0)
    keyframes!(upndown, 0percent, "transform" => translateX(0percent))
    keyframes!(upndown, 10percent, "transform" => translateX(2percent))
    keyframes!(upndown, 20percent, "transform" => translateX(1percent))
    keyframes!(upndown, 30percent, "transform" => translateX(2percent))
    keyframes!(upndown, 40percent, "transform" => translateX(3percent))
    keyframes!(upndown, 60percent, "transform" => translateX(1percent))
    keyframes!(upndown, 80percent, "transform" => translateX(2percent))
    keyframes!(upndown, 100percent, "transform" => translateX(0percent))
    newcomp = button("sampbutt", text = "sample")
    style!(newcomp, "transition" => 3s)
    on(newcomp, "click") do cl
        style!(cl, seconddiv, "padding" => 10px, "background-color" => "red", "color" => "white", "animation-name" => "nil")
        set_text!(cl, seconddiv, "i mostly made this to test animations lol")
    end
    style!(newcomp, upndown)
    write!(c, upndown, newcomp)
end

mobile = route("/") do c::Toolips.MobileConnection

end

# multiroute (will call `mobile` if it is a `MobileConnection`)
home = route(main, mobile)

# docs & api manager (/doc && /toolips)
api_man = toolips_app
docs = toolips_doc


export home, default_404
export api_man, docs
export logger
end # - module