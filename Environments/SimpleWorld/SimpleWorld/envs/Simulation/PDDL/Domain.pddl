(define (domain SimpleGridWorld)

    (:requirements
        :strips :typing
    )

    (:types
        Location
        Robot
    )

    (:predicates
        (at ?r - Robot ?l - Location)
        (connected ?l1 ?l2 - Location)
        (collected ?l - Location)
    )

    (:action move
        :parameters (?r - Robot ?l1 ?l2 - Location)
        :precondition (and 
            (at ?r ?l1)
			(connected ?l1 ?l2)
            )
        :effect (and
            (not (at ?r ?l1))
            (at ?r ?l2)
            (collected ?l2)
            )
    )
)