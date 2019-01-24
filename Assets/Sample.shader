Shader "Unlit/Sample"
{
    Properties
    {
        // NOTE:
        // This is needed to avoid "Property is not defined" error.
        // UNITY_DECLARE_TEX2DARRAY is not initialized in sometimes, especially in scene load.

        [HideInInspector]
        _Textures ("Textures", 2DArray) = "" {}
    }

    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv     : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv     : TEXCOORD0;
            };

            UNITY_DECLARE_TEX2DARRAY(_Textures);
            uint  _TexturesLength;

            v2f vert (appdata v)
            {
                v2f o;

                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = v.uv;

                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                int texIndex = _Time.y % _TexturesLength;
                return UNITY_SAMPLE_TEX2DARRAY(_Textures, float3(i.uv.xy, texIndex));
            }
            ENDCG
        }
    }
}
