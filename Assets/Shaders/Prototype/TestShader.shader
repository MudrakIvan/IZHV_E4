Shader "Custom/TestShader"
{
    Properties
    { 
        [MainColor] _BaseColor ("Base Color", Color) = (1,1,1,1)
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalRenderPipeline" }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vMain
            #pragma fragment fMain

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"            

            struct VertIn
            {
                float4 position : POSITION;                 
            };

            struct VertOut
            {
                float4 position : SV_POSITION;
            };

            CBUFFER_START(UnityPerMaterial)
                half4 _BaseColor;
            CBUFFER_END

            VertOut vMain(VertIn input)
            {
                VertOut output;
                output.position = TransformObjectToHClip(input.position.xyz);
                return output;
            }

            half4 fMain() : SV_Target
            {
                return _BaseColor;
            }
            ENDHLSL
        }
    }
}
