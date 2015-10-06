/++
 + Authors: meatRay
 + Written for educational purposes, use as desired
 +/

import std.stdio :writef, writefln, readln;
import std.conv  :parse;
import std.math  :pow;

void main()
{
	double x, y;
	double S, T;
	
	/+Acquire some data.+/
	SamplePT a =AcquireInput( "A" );
	SamplePT b =AcquireInput( "B" );
	SamplePT c =AcquireInput( "C" );

	
	S = ( pow(c.X,2.0) -pow(b.X,2.0) +pow(c.Y,2.0) -pow(b.Y,2.0) +pow(b.Distance,2.0) -pow(c.Distance,2.0) ) /2.0;
	T = ( pow(a.X,2.0) -pow(b.X,2.0) +pow(a.Y,2.0) -pow(b.Y,2.0) +pow(b.Distance,2.0) -pow(a.Distance,2.0) ) /2.0;

	y = ( (T *(b.X -c.X)) - (S *(b.X -c.X)) ) /( 
		  ((a.Y -b.Y) * (b.X -c.X)) 
		- ((c.Y -b.Y) * (b.X -c.X)) );

	x = ( (y *(a.Y-b.Y) ) -T) /(b.X -a.X);

	
	writefln("Target: (%f, %f)\n(Press Any Key to Exit)", x, y);
	readln();
}

///
SamplePT AcquireInput( )
	{ return AcquireInput( "" ); }
/++
 + Acquire data about a point from the user.
 + Params:
 + point_name = A name to reference the Point by.
 +/
SamplePT AcquireInput( string point_name )
{
    SamplePT point;
    writef("Enter the x coordinate of point %s: ", point_name);
    string input =readln(); /+Template stuff I forgot. parse!double(readln()) unhappy. +/
    point.X =parse!double(input);

    writef("Enter the y coordinate of point %s: ", point_name);
    input =readln();
    point.Y =parse!double(input);
    
    writef("Enter distance of point %s to Target: ", point_name);
    input =readln();
    point.Distance =parse!double(input);
    
    return point;
}

/++
 + Stores Input data about a point
 +/
struct SamplePT
{
	///
    public double X, Y, Distance;
}