[top]
components : FallRock

[FallRock]
type : cell
dim : (20,20,20)
delay : transport
defaultDelayTime : 100
border : nowrapped
neighbors : FallRock(0,-1,-2)
neighbors : FallRock(1,-1,-1) FallRock(0,-1,-1) FallRock(-1,-1,-1) 
neighbors : FallRock(1,0,0)  FallRock(0,0,0)  FallRock(-1,0,0)
neighbors : FallRock(1,1,1)  FallRock(0,1,1)  FallRock(-1,1,1)
neighbors : FallRock(0,-2,-1) FallRock(1,-2,-1)  FallRock(-1,-2,-1)
initialValue : 0
initialCellsValue : init.val
StateVariables : stateVal kineticEnergyVal frictionVal shapeVal
stateValues : 0 0 0 0
InitialVariablesValue : initial.stvalues
zone : slope75 { (0,0,0)..(19,19,6) } 
zone : slope45 { (0,0,8)..(19,19,12) }
zone : slope15 { (0,0,14)..(19,19,19) } 
localTransition : FallRockBehavior

[slope75]
%Rock Falls along 75 degree 

%Motionless
rule : 
{ 
	( 0 - $frictionVal )
}  
{  
	$stateVal := 0 ; 
	$kineticEnergyVal := 0 ; 
} 
100     
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.40 * (0,-1,-2)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (1,-1,-1)
			+ 0.23 * (-1,-1,-1)
			) < $frictionVal
        ) AND
        (
        	$stateVal = 0 
        )
}

 
%Toppling
rule :  
{ 
 0 
} 
{ 
	$stateVal := 1 ; 
	$kineticEnergyVal := 0 ;
	 
} 
100
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.40 * (0,-1,-2)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (1,-1,-1)
			+ 0.23 * (-1,-1,-1)
			) > $frictionVal
        ) AND
        (( 0.98689 * $kineticEnergyVal
			+ 0.40 * (0,-1,-2)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (1,-1,-1)
			+ 0.23 * (-1,-1,-1)
			) < ($frictionVal+20)
        ) AND
        (
        	$stateVal = 0   OR	 $stateVal = 1 
        ) 
}



%falling
rule :  
{ 

		(( 0.98689 * $kineticEnergyVal
			+ 0.40 * (0,-1,-2)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (1,-1,-1)
			+ 0.23 * (-1,-1,-1)
		 )-  $frictionVal) 
	
}  
{  
	$stateVal := 2 ; 
	$kineticEnergyVal := 
			(( 0.98689 * $kineticEnergyVal
			+ 0.40 * (0,-1,-2)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (1,-1,-1)
			+ 0.23 * (-1,-1,-1)
			 )-  $frictionVal) ;
	
} 
100
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.40 * (0,-1,-2)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (1,-1,-1)
			+ 0.23 * (-1,-1,-1)
			 ) > ($frictionVal + 20)
        ) AND
        (
        	$stateVal = 0   OR	 $stateVal = 1 
        )	
 
}


 %rolling

rule :  
{ 
	( 0.98689 * $kineticEnergyVal + 0.50 )	
}  
{  
	$stateVal := 3 ; 
} 
100
{ 

         $stateVal = 2 AND
	    $shapeVal = 0 

}

%bouncing
rule :  
{ 
	0
}  
{  
	$stateVal := 4 ;
} 
100
{ 

         $stateVal = 2   AND
	    $shapeVal = 1 

}
rule : 
{ ( 0,0,0 ) } 0 { t }


[slope45]

%Rock Falls along 45 degree 

%Motionless
rule : 
{ 
	( 0 - $frictionVal )
}  
{  
	$stateVal := 0 ; 
	$kineticEnergyVal := 0 ; 
} 
100     
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.23 * (1,-1,-1)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (-1,-1,-1)
			+ 0.38 * (1,0,0)
			+ 0.38 * (-1,0,0)
			 ) < $frictionVal
        ) AND
        (
        	$stateVal = 0 
        )
}

 
%Toppling
rule :  
{ 
 0 
} 
{ 
	$stateVal := 1 ; 
	$kineticEnergyVal := 0 ;
	 
} 
100
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.23 * (1,-1,-1)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (-1,-1,-1)
			+ 0.38 * (1,0,0)
			+ 0.38 * (-1,0,0)
			 ) > $frictionVal
        ) AND
        (( 0.98689 * $kineticEnergyVal
			+ 0.23 * (1,-1,-1)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (-1,-1,-1)
			+ 0.38 * (1,0,0)
			+ 0.38 * (-1,0,0)
			 ) < ($frictionVal+20)
        ) AND
        (
        	$stateVal = 0   OR	 $stateVal = 1 
        ) 
}



%falling
rule :  
{ 

		(( 0.98689 * $kineticEnergyVal
		+ 0.23 * (1,-1,-1)
		+ 0.50 * (0,-1,-1)
		+ 0.23 * (-1,-1,-1)
		+ 0.38 * (1,0,0)
		+ 0.38 * (-1,0,0)
		+ 0.50 )-  $frictionVal) 
	
}  
{  
	$stateVal := 2 ; 
	$kineticEnergyVal := 
			(( 0.98689 * $kineticEnergyVal
			+ 0.23 * (1,-1,-1)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (-1,-1,-1)
			+ 0.38 * (1,0,0)
			+ 0.38 * (-1,0,0)
			+ 0.50 )-  $frictionVal) ;
	
} 
100
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.23 * (1,-1,-1)
			+ 0.50 * (0,-1,-1)
			+ 0.23 * (-1,-1,-1)	
			+ 0.38 * (1,0,0)
			+ 0.38 * (-1,0,0)
			+ 0.50 ) > ($frictionVal + 20)
        ) AND
        (
        	$stateVal = 0   OR	 $stateVal = 1 
        )	
 
}


 %rolling

rule :  
{ 
	( 0.98689 * $kineticEnergyVal + 0.50 )	
}  
{  
	$stateVal := 3 ; 	
} 
100
{ 

         $stateVal = 2  AND
	 $shapeVal = 0 

}

%bouncing
rule :  
{ 
	0
}  
{  
	$stateVal := 4 ; 	
} 
100
{ 

         $stateVal = 2 AND
	 $shapeVal = 1

}
rule : 
{ ( 0,0,0 ) } 0 { t }


[slope15]

%Rock Falls along 15 degree 
%Motionless
rule : 
{ 
	( 0 - $frictionVal )
}  
{  
	$stateVal := 0 ; 
	$kineticEnergyVal := 0 ; 
} 
100     
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.50 * (0,-2,-1) 
			+ 0.50 * (1,-2,-1)
			+ 0.50 * (-1,-2,-1)
			+ 0.50 ) < $frictionVal
        ) AND
        (
        	$stateVal = 0 
        )
}

 
%Toppling
rule :  
{ 
 0 
} 
{ 
	$stateVal := 1 ; 
	$kineticEnergyVal := 0 ;
	 
} 
100
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.50 * (0,-2,-1)
			+ 0.50 * (1,-2,-1)
			+ 0.50 * (-1,-2,-1)
			+ 0.50 ) > $frictionVal
        ) AND
        (( 0.98689 * $kineticEnergyVal
			+ 0.50 * (0,-2,-1)
			+ 0.50 * (1,-2,-1)
			+ 0.50 * (-1,-2,-1)
			+ 0.50 ) < ($frictionVal+50)
        ) AND
        (
        	$stateVal = 0   OR	 $stateVal = 1 
        ) 
}



%falling
rule :  
{ 

		(( 0.98689 * $kineticEnergyVal
			+ 0.50 * (0,-2,-1)
			+ 0.50 * (1,-2,-1)
			+ 0.50 * (-1,-2,-1)
		+ 0.50 )-  $frictionVal) 
	
}  
{  
	$stateVal := 2 ; 
	$kineticEnergyVal := 
			(( 0.98689 * $kineticEnergyVal
			+ 0.50 * (0,-2,-1)
			+ 0.50 * (1,-2,-1)
			+ 0.50 * (-1,-2,-1)
			+ 0.50 )-  $frictionVal) ;
	
} 
100
{ 
       (( 0.98689 * $kineticEnergyVal
			+ 0.50 * (0,-2,-1)
			+ 0.50 * (1,-2,-1)
			+ 0.50 * (-1,-2,-1)
			+ 0.50 ) > ($frictionVal + 50)
        ) AND
        (
        	$stateVal = 0   OR	 $stateVal = 1 
        )	
 
}


%bouncing
rule :  
{ 
	( 0.98689 * $kineticEnergyVal + 0.50 )	
}  
{  
	$stateVal := 4 ; 
} 
100
{ 

         $stateVal = 2   OR	 $stateVal = 3  
}
rule : 
{ ( 0,0,0 ) } 0 { t }


[FallRockBehavior]


%other cells behavior

rule : 
{ ( 0,0,0 ) } 0 { t }










