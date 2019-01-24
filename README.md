# Unity_SetTexturesToMaterial

``SetTexturesToMaterial`` will Make ``Texture2DArray`` and set it to material in runtime.

## Import to Your Project

You can import this asset from UnityPackage.

- [SetTexturesToMaterial.unitypackage](https://github.com/XJINE/Unity_SetTexturesToMaterial/blob/master/SetTexturesToMaterial.unitypackage)

### Dependencies

You have to import following assets to use this asset.

- [Unity_IInitializable](https://github.com/XJINE/Unity_IInitializable)
- [Unity_Texture2DArrayGenerator](https://github.com/XJINE/Unity_Texture2DArrayGenerator)

## How to Use

<img src="https://github.com/XJINE/Unity_SetTexturesToMaterial/blob/master/Screenshot.png" width="100%" height="auto" />

Set ``material``, ``parameter``(means name) and ``textures``. That's all.

Additionary, ``textures.Length`` value will be set to ``"parameter + Length"``.
Ex. when the ``prameter`` value is ``_Textures``, ``(u)int _TexturesLength`` parameter gets ``textures.Length`` value.