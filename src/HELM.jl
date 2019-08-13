__precompile__(true)
module HELM


"""
<div>
  <h1>Hi</h1>
  <h2>hi</h1>
</div>
"""

struct html
  type::String
  children::Union{Array{html}, String}
end

function parse(h)
  if typeof(h.children) <: nothing
    "<$(h.type)>$(h.children)</$(h.type)>"
  else
    "<$(h.type)>$(join(map(parse, h.children)))</$(h.type)>"
  end
end

macro txt(str::String)
  html("", str)
end

macro div(str)
  html("div", eval(str))
end

macro h1(str)
  html("h1", eval(str))
end
macro h2(str)
  html("h2", eval(str))
end

macro h3(str)
  html("h3", eval(str))
end

macro h4(str)
  html("h4", eval(str))
end
macro h5(str)
  html("h5", eval(str))
end
macro h6(str)
  html("h6", eval(str))
end
macro p(str)
  html("p", eval(str))
end
end # module
