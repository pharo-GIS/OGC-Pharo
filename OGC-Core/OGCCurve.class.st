"
6.1.6 Curve

6.1.6.1 Description

A Curve is a 1-dimensional geometric object usually stored as a sequence of Points, with the subtype of Curve
specifying the form of the interpolation between Points. This standard defines only one subclass of Curve,
LineString, which uses linear interpolation between Points. 
"
Class {
	#name : #OGCCurve,
	#superclass : #OGCGeometry,
	#category : 'OGC-Core'
}
