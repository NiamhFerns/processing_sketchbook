// These are the possible textures we can assign to a cell.
public enum CellTexture {
    DEFAULT,
    HOVERED,
    SELECTED,
    HOVER_SELECTED,
    DANGER,
    HOVER_DANGER,
    VIABLE_MOVE,
    HOVER_VIABLE_MOVE,
    DANGER_CROSS
}

// Template pattern to fill out textures for black & white
public abstract class CellTextureHandler {
    protected HashMap<CellTexture, PImage> textures;

    // We force the subclasses to fill out any textures needed by that thing.    
    public abstract void fillTextures();

    // Get a specific texture.
    public PImage get(CellTexture texture) {
        return textures.get(texture);
    }

    public CellTextureHandler() {
        textures = new HashMap<CellTexture, PImage>();
        fillTextures();
        textures.put(CellTexture.DANGER_CROSS     , loadImage("textures/tiles/crossTile.png"       ));
        textures.put(CellTexture.SELECTED         , loadImage("textures/tiles/tileSelected.png"    ));
        textures.put(CellTexture.HOVER_SELECTED   , loadImage("textures/tiles/tileSelected_HO.png" ));
        for (PImage p : textures.values()) {
            p.resize(CELLSIZE, CELLSIZE);
        }
    }
}

public class WhiteCellTextures extends CellTextureHandler {
    public void fillTextures() {
        textures.put(CellTexture.DEFAULT          , loadImage("textures/tiles/tileBlack.png"       ));
        textures.put(CellTexture.HOVERED          , loadImage("textures/tiles/tileBlack_HO.png"    ));
        textures.put(CellTexture.DANGER           , loadImage("textures/tiles/tileBlack_DA.png"    ));
        textures.put(CellTexture.HOVER_DANGER     , loadImage("textures/tiles/tileBlack_HODA.png"  ));
        textures.put(CellTexture.VIABLE_MOVE      , loadImage("textures/tiles/tileBlack_VM.png"    ));
        textures.put(CellTexture.HOVER_VIABLE_MOVE, loadImage("textures/tiles/tileBlack_HOVM.png"  ));
    }
}

public class BlackCellTextures extends CellTextureHandler {
    public void fillTextures() {
        textures.put(CellTexture.DEFAULT          , loadImage("textures/tiles/tileWhite.png"       ));
        textures.put(CellTexture.HOVERED          , loadImage("textures/tiles/tileWhite_HO.png"    ));
        textures.put(CellTexture.DANGER           , loadImage("textures/tiles/tileWhite_DA.png"    ));
        textures.put(CellTexture.HOVER_DANGER     , loadImage("textures/tiles/tileWhite_HODA.png"  ));
        textures.put(CellTexture.VIABLE_MOVE      , loadImage("textures/tiles/tileWhite_VM.png"    ));
        textures.put(CellTexture.HOVER_VIABLE_MOVE, loadImage("textures/tiles/tileWhite_HOVM.png"  ));
    }
}