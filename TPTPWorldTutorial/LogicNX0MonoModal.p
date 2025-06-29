tff(semantics,logic,
    $alethic_modal == 
      [ $domains == $constant,
        $designation == $rigid,
        $terms == $global,
        $modalities == $modal_system_M ] ).

tff(person_type,type,
    person: $tType ).

tff(product_type,type,
    product: $tType ).

tff(alex_decl,type,
    alex: person ).

tff(leo_decl,type,
    leo: product ).

tff(advisor_of_decl,type,
    advisor_of: person > person ).

tff(work_hard_decl,type,
    work_hard: ( person * product ) > $o ).

tff(gets_rich_decl,type,
    gets_rich: person > $o ).

tff(work_hard_to_get_rich,axiom,
    ! [P: person] :
      ( ? [R: product] : work_hard(P,R)
     => ( {$possible} @ ( gets_rich(P) ) ) ) ).

tff(not_all_get_rich,axiom,
    ~ ? [P: person] : ( {$necessary} @ ( gets_rich(P) ) ) ).

tff(one_rich,axiom,
    ! [P: person,O: person] :
      ( ( gets_rich(P)
        & O != P )
     => ( {$necessary} @ ( ~ gets_rich(O) ) ) ) ).

tff(alex_works_on_leo_here,axiom-local,
    work_hard(alex,leo) ).

tff(alex_advisor_works_on_leo_here,axiom-local,
    work_hard(advisor_of(alex),leo) ).

tff(no_self_advising,axiom,
    ! [P: person] : ( P != advisor_of(P) ) ).

tff(someone_gets_rich_but_not_advisor,conjecture,
    ? [P: person] :
      ( {$possible}
      @ ( gets_rich(P)
        & ~ gets_rich(advisor_of(P)) ) ) ).

% thf(someone_gets_rich_but_not_advisor,conjecture,
%     ? [P: person] :
%     ? [F: person > person] :
%       ( {$possible}
%       @ ( ( gets_rich @ P) )
%         & ~ ( gets_rich @ (F @ P) ) ) ).

