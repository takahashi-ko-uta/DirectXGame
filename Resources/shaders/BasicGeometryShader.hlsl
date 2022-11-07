#include "BasicShaderHeader.hlsli"

//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION, 
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;
	//‹¤’Ê
	element.normal = input[0].normal;
	element.uv = input[0].uv;
	//‚P“_–Ú
	element.svpos = input[0].svpos;
	output.Append(element);
	//‚Q“_–Ú
	element.svpos = input[0].svpos + float4(10.0f,10.0f,0,0);
	output.Append(element);
	//‚R“_–Ú
	element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
	output.Append(element);
}

