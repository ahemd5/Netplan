"""Sample floorplan generator (used by the in-app 'Sample' button)."""
import ezdxf

def build_sample(path: str) -> str:
    doc = ezdxf.new(); doc.units = 4; msp = doc.modelspace()      # 4 = millimetres
    for l in ("A-WALL", "A-FURN", "A-ANNO"): doc.layers.add(l)
    for a, b in [((0,0),(12000,0)),((12000,0),(12000,8000)),((12000,8000),(0,8000)),((0,8000),(0,0)),
                 ((4000,0),(4000,3000)),((4000,3900),(4000,8000)),        # 900 mm door opening
                 ((8000,0),(8000,8000)),((8000,4000),(12000,4000))]:
        msp.add_line(a, b, dxfattribs={"layer": "A-WALL"})
    for x, y, t in [(2000,4000,"Server Room"),(6000,4000,"Open Office"),(10000,2000,"Meeting"),(10000,6000,"Storage")]:
        msp.add_text(t, height=250, dxfattribs={"layer": "A-ANNO", "insert": (x, y)})
    msp.add_lwpolyline([(5000,1000),(7000,1000),(7000,2000),(5000,2000)], close=True, dxfattribs={"layer": "A-FURN"})
    doc.saveas(path); return path
