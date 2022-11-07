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
//[maxvertexcount(3)]
//void main(
//	point VSOutput input[1] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//	//����
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	//�P�_��
//	element.svpos = input[0].svpos;
//	output.Append(element);
//	//�Q�_��
//	element.svpos = input[0].svpos + float4(10.0f,10.0f,0,0);
//	output.Append(element);
//	//�R�_��
//	element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
//	output.Append(element);
//}

//�l�p�`�̒��_��
static const uint vnum = 4;

//�Z���^�[����̃I�t�Z�b�g
static const float4 offset_array[vnum] =
{
	float4(-0.5f,-0.5f,0,0),//����
	float4(-0.5f,+0.5f,0,0),//����
	float4(+0.5f,-0.5f,0,0),//�E��
	float4(+0.5f,+0.5f,0,0)	//�E��
};

//���オ0,0 �E�オ1,1
static const float2 uv_array[vnum] =
{
	float2(0,1),//����
	float2(0,0),//����
	float2(1,1),//�E��
	float2(1,0)	//�E��
};

//�_�̓��͂���A�l�p�`���o��
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;
	//4�_���܂킷
	for(uint i = 0;i < vnum;i++)
	{
		//���[���h���W�x�[�X�ŁA���炷
		element.svpos = input[0].pos + offset_array[i];
		//�r���[�A�ˉe�ϊ�
		element.svpos = mul(mat, element.svpos);
		//element.uv = float2(0.5f, 0.5f);
		element.uv = uv_array[i];
		output.Append(element);
	}
}


