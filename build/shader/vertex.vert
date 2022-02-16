#version 330 core
layout (location = 0) in vec3 aPos;
uniform mat4 u_transform;
out vec3 vertex_position;
void main()
{
    gl_Position = u_transform * vec4(aPos, 1.0);
    vertex_position = aPos;
}