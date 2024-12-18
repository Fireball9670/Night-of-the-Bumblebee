function GetAngleComponents(angleRadians, velocity)
    return velocity * math.cos(angleRadians), velocity * math.sin(angleRadians)   
end