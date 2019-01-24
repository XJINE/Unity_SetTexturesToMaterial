using UnityEngine;

public class SetTexturesToMaterial : MonoBehaviour, IInitializable
{
    #region Field

    public Material      material;
    public string        parameter = "_Textures";
    public TextureFormat format    = TextureFormat.ARGB32;
    public Texture2D[]   textures;

    #endregion Field

    #region Property

    public bool IsInitialized { get; protected set; }

    #endregion Property

    #region Method

    protected virtual void Start()
    {
        Initialize();
    }

    public bool Initialize()
    {
        if (this.IsInitialized)
        {
            return false;
        }

        this.IsInitialized = true;
        this.material.SetTexture(this.parameter, Texture2DArrayGenerator.Generate(this.textures, this.format));
        this.material.SetInt    (this.parameter + "Length", this.textures.Length);

        return true;
    }

    #endregion Method
}