// gets rid of black sky under horizon.

#version 150

#moj_import <fog.glsl>

in vec3 Position;

uniform mat4 ProjMat;
uniform mat4 ModelViewMat;
uniform int FogShape;

out float vertexDistance;

void main() {
    if (ProjMat[3][2] != 2.0) { // icky.
        gl_Position = ProjMat * vec4(Position, 1.0);
        gl_Position.y = -gl_Position.z;
    } else { // vanilla behavior.
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    }

    vertexDistance = fog_distance(ModelViewMat, Position, FogShape);
}
