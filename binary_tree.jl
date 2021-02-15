"""
Node is the basic structural datatype of a Binary tree
"""
struct Node{T}
    payload::T
    left::Union{Node, Nothing}
    right::Union{Node, Nothing}


    function Node(payload)
        new{typeof(payload)}(payload, nothing, nothing)
    end

    function Node(payload, l::Node, r::Node)
        new{typeof(payload)}(payload, l, r)
    end
end

"""
Encodes the traversal and visitation of a Binayr tree.

Note that the actual visitor is the function visitor_fn. This is one
of the nice things about Julia's runtime multiple dispatch.
"""
function traverse(n::Node, visitor_fn)
    visitor_fn(n.payload)
    if !isnothing(n.left)
        traverse(n.left, visitor_fn)
    end
    if !isnothing(n.right)
        traverse(n.right, visitor_fn)
    end
end

function myprint(value::String)
    println("I am a Sting $value")
end

function myprint(value::Int)
    println("I am an int $value")
end


l = Node(34)
r = Node("Hi there")
r = Node(1, l, r)

traverse(r, myprint)