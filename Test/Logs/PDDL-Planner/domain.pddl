(define (domain SimpleSatelliteSetGoals)

    (:requirements
        :durative-actions
        :timed-initial-literals 
        :equality
        :negative-preconditions
        :numeric-fluents
        :object-fluents
        :typing
    ) 

    (:types
        image
    )

    (:predicates
        (image_available ?i  - image)
        (dump_available)
        
        (sat_busy)
        (sat_free)
    )

    (:functions
        (image_Unanalysed ?i - image)
        (image_analysed ?i - image)
        (image_score ?i - image)
        (memory_level)
        (total_score)
    )

    (:durative-action take_picture
        :parameters (?i - image)
        :duration (= ?duration 14)
        :condition (and 
            (at start (sat_free))
            (at start (image_available ?i))
            (at start (< (memory_level) 1.0)) 
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (not (sat_busy)))
            (at end (sat_free))
            (at end (increase (image_Unanalysed ?i) 1))
            (at end (increase (memory_level) 0.067))
            )
    )
  
    (:durative-action analyze
        :parameters (?i - image)
        :duration (= ?duration 32)
        :condition (and 
            (at start (sat_free))
            (at start (> (image_Unanalysed ?i) 0)) 
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (increase (image_Unanalysed ?i) -1))
            (at end (increase (image_analysed ?i) 1))
            (at end (not (sat_busy)))
            (at end (sat_free))
            )
    )
    
    (:durative-action dump
        :parameters (?i - image)
        :duration (= ?duration 14)
        :condition (and
            (at start (sat_free))
            (at start (> (image_analysed ?i) 0)) 
            (at start (dump_available))
            )
        :effect (and
            (at start (not (sat_free)))
            (at start (sat_busy))
            (at end (increase (memory_level) -0.067))
            (at end (increase (image_analysed ?i) -1))
            (at end (increase (image_score ?i) 1))
            (at end (increase (total_score) 1))
            (at end (not (sat_busy)))
            (at end (sat_free))
            
            )
    )
)