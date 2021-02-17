module SDL

using SimpleDirectMediaLayer

# Clear with a specific color provided as RGB
function clear_with_color(window, r, g, b)
    renderer = SimpleDirectMediaLayer.GetRenderer(window)
    SimpleDirectMediaLayer.SetRenderDrawColor(renderer, r, g, b, 0)
    SimpleDirectMediaLayer.RenderClear(renderer)
    SimpleDirectMediaLayer.RenderPresent(renderer)
end

# Clear window with white color
clear(window) = clear_with_color(window, 255, 255, 255)

function main()
    SimpleDirectMediaLayer.init()

    # Ptr{SDL.Window}
    win = SimpleDirectMediaLayer.CreateWindow("my window",
                                          Int32(0), Int32(0),
                                          Int32(800), Int32(600),
                                          UInt32(SimpleDirectMediaLayer.WINDOW_OPENGL));

    # See https://wiki.libsdl.org/SDL_CreateRenderer
    SimpleDirectMediaLayer.CreateRenderer(win, Int32(-1), UInt32(0))

    # Change the color of the window gradually
    r, g, b = (0, 0, 0)
    for r in 255:255
        for g in 0:255
            clear_with_color(win, r, g, g)
            SimpleDirectMediaLayer.Delay(UInt32(20))            
        end
    end

    # Wait a bit and finalize
    SimpleDirectMediaLayer.Delay(UInt32(3000))
    SimpleDirectMediaLayer.Quit()
end

main()
    
end # module
