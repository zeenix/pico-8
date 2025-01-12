function _init()
    particles = {}
    force = 0
    forced = 0.02
end

function _update()
    if force < -.5 or force > rnd(.5) then
        forced = -forced
    end

    force += forced

    for i = 1, 20 do
        add(particles, {
            x = 57 + rnd(10),
            y = 90 + rnd(10),
            r = rnd(3),
            c = 7,
            l = 13,
            speed = 1 + rnd(2),
        })
    end

    for p in all(particles) do
        p.y -= p.speed
        p.x += force
        p.r -= .1
        p.l -= 1

        if (p.l < 11) p.c = 10
        if (p.l < 8) p.c = 9
        if (p.l < 0) del(particles, p)
    end
end

function _draw()
    cls()

    for p in all(particles) do
        circfill(p.x, p.y, p.r, p.c)
    end
end