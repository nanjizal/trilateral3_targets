package trilateral3.target.heaps;

import trilateral3.Trilateral;
import trilateral3.drawing.Pen;
import trilateral3.geom.FlatColorTriangles;
import trilateral3.nodule.PenNodule;
import trilateral3.geom.FlatColorTriangles;
import h2d.Graphics;
class AppHeaps extends hxd.App {
    public var pen: Pen;
    public var nodule = new PenNodule( false ); // same as PenNodule without transform.
    public var width:  Int;
    public var height: Int;
    public var tri: FlatColorTriangles;
    var g:    h2d.Graphics; 
    var first = true;
    override
    function init() {
        super.init();
        internalSetup();
        firstDraw();
    }
    
    inline
    function internalSetup(){
        engine.backgroundColor = 0xFF804020;
        g       = new h2d.Graphics( s2d );
        width   = s2d.width;
        height  = s2d.height;
        pen     = nodule.pen;
        tri     = nodule.colorTriangles;
    }
    inline
    function firstDraw(){
        draw();
        internalDraw();
    }
    // override
    public
    function draw(){
        // draw stuff once
    }
    override
    function render(_){
        if( first ){
            renderDraw();
            internalDraw();
            super.render(_);
        }
        first = false;
    }
    inline
    function internalDraw(){
        g.clear();
        var currPos = 0;
        tri.pos = 0;
        for( i in 0...nodule.size ){
             tri.pos = i; // change the position.
             g.beginFill( 0xffffff );
             // ignore z for now
             g.addVertex( tri.ax, tri.ay, tri.redA, tri.greenA, tri.blueA, tri.alphaA );
             g.addVertex( tri.bx, tri.by, tri.redB, tri.greenB, tri.blueB, tri.alphaB );
             g.addVertex( tri.cx, tri.cy, tri.redC, tri.greenC, tri.blueC, tri.alphaC );
             g.endFill();
         } 
         // reset pos afterwards probably not need
         tri.pos = currPos;
    }
    // override
    public
    function renderDraw(){
        // draw stuff every frame
    }
    override
    function update( dt: Float ) {
        
    }
    
}
