% SZS output start Refutation for LogicNX0MonoModal.p
thf(person_type,type,
    person: $tType ).

thf(product_type,type,
    product: $tType ).

% thf('world_type', type, $world: $tType).
% thf('local_world_type', type, $local_world: $world).
% thf('accessible_world_type', type, $accessible_world: ($world > ($world > $o))).
thf(alex_type,type,
    alex: person ).

thf(leo_type,type,
    leo: product ).

thf(advisor_of_type,type,
    advisor_of: person > person ).

thf(work_hard_type,type,
    work_hard: $world > person > product > $o ).

thf(gets_rich_type,type,
    gets_rich: $world > person > $o ).

thf(sk1_type,type,
    sk1: person > $world > $world ).

thf(3,axiom,
    ! [A: $world] : ( $accessible_world @ A @ A ),
    file('LogicNX0MonoModal.p',mrel_reflexive) ).

thf(12,plain,
    ! [A: $world] : ( $accessible_world @ A @ A ),
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[3]) ).

thf(13,plain,
    ! [A: $world] : ( $accessible_world @ A @ A ),
    inference(cnf,[status(esa)],[12]) ).

thf(7,axiom,
    work_hard @ $local_world @ alex @ leo,
    file('LogicNX0MonoModal.p',alex_works_on_leo_here) ).

thf(24,plain,
    work_hard @ $local_world @ alex @ leo,
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[7]) ).

thf(4,axiom,
    ! [A: $world,B: person] :
      ( ? [C: product] : ( work_hard @ A @ B @ C )
     => ? [C: $world] :
          ( ( $accessible_world @ A @ C )
          & ( gets_rich @ C @ B ) ) ),
    file('LogicNX0MonoModal.p',work_hard_to_get_rich) ).

thf(14,plain,
    ! [A: $world,B: person] :
      ( ? [C: product] : ( work_hard @ A @ B @ C )
     => ? [C: $world] :
          ( ( $accessible_world @ A @ C )
          & ( gets_rich @ C @ B ) ) ),
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[4]) ).

thf(16,plain,
    ! [C: product,B: person,A: $world] :
      ( ~ ( work_hard @ A @ B @ C )
      | ( gets_rich @ ( sk1 @ B @ A ) @ B ) ),
    inference(cnf,[status(esa)],[14]) ).

thf(335,plain,
    ! [C: product,B: person,A: $world] :
      ( ( gets_rich @ ( sk1 @ B @ A ) @ B )
      | ( ( work_hard @ $local_world @ alex @ leo )
       != ( work_hard @ A @ B @ C ) ) ),
    inference(paramod_ordered,[status(thm)],[24,16]) ).

thf(336,plain,
    gets_rich @ ( sk1 @ alex @ $local_world ) @ alex,
    inference(pattern_uni,[status(thm)],[335:[bind(A,$thf( $local_world )),bind(B,$thf( alex )),bind(C,$thf( leo ))]]) ).

thf(1,conjecture,
    ? [A: person,B: $world] :
      ( ( $accessible_world @ $local_world @ B )
      & ( gets_rich @ B @ A )
      & ~ ( gets_rich @ B @ ( advisor_of @ A ) ) ),
    file('LogicNX0MonoModal.p',someone_gets_rich_but_not_advisor) ).

thf(2,negated_conjecture,
    ~ ? [A: person,B: $world] :
        ( ( $accessible_world @ $local_world @ B )
        & ( gets_rich @ B @ A )
        & ~ ( gets_rich @ B @ ( advisor_of @ A ) ) ),
    inference(neg_conjecture,[status(cth)],[1]) ).

thf(10,plain,
    ~ ? [A: person,B: $world] :
        ( ( $accessible_world @ $local_world @ B )
        & ( gets_rich @ B @ A )
        & ~ ( gets_rich @ B @ ( advisor_of @ A ) ) ),
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[2]) ).

thf(11,plain,
    ! [B: $world,A: person] :
      ( ~ ( $accessible_world @ $local_world @ B )
      | ~ ( gets_rich @ B @ A )
      | ( gets_rich @ B @ ( advisor_of @ A ) ) ),
    inference(cnf,[status(esa)],[10]) ).

thf(345,plain,
    ! [B: $world,A: person] :
      ( ~ ( $accessible_world @ $local_world @ B )
      | ( gets_rich @ B @ ( advisor_of @ A ) )
      | ( ( gets_rich @ ( sk1 @ alex @ $local_world ) @ alex )
       != ( gets_rich @ B @ A ) ) ),
    inference(paramod_ordered,[status(thm)],[336,11]) ).

thf(346,plain,
    ( ~ ( $accessible_world @ $local_world @ ( sk1 @ alex @ $local_world ) )
    | ( gets_rich @ ( sk1 @ alex @ $local_world ) @ ( advisor_of @ alex ) ) ),
    inference(pattern_uni,[status(thm)],[345:[bind(A,$thf( alex )),bind(B,$thf( sk1 @ alex @ $local_world ))]]) ).

thf(15,plain,
    ! [C: product,B: person,A: $world] :
      ( ~ ( work_hard @ A @ B @ C )
      | ( $accessible_world @ A @ ( sk1 @ B @ A ) ) ),
    inference(cnf,[status(esa)],[14]) ).

thf(111,plain,
    ! [C: product,B: person,A: $world] :
      ( ( $accessible_world @ A @ ( sk1 @ B @ A ) )
      | ( ( work_hard @ $local_world @ alex @ leo )
       != ( work_hard @ A @ B @ C ) ) ),
    inference(paramod_ordered,[status(thm)],[24,15]) ).

thf(112,plain,
    $accessible_world @ $local_world @ ( sk1 @ alex @ $local_world ),
    inference(pattern_uni,[status(thm)],[111:[bind(A,$thf( $local_world )),bind(B,$thf( alex )),bind(C,$thf( leo ))]]) ).

thf(583,plain,
    ( ~ $true
    | ( gets_rich @ ( sk1 @ alex @ $local_world ) @ ( advisor_of @ alex ) ) ),
    inference(rewrite,[status(thm)],[346,112]) ).

thf(584,plain,
    gets_rich @ ( sk1 @ alex @ $local_world ) @ ( advisor_of @ alex ),
    inference(simp,[status(thm)],[583]) ).

thf(6,axiom,
    ! [A: $world,B: person,C: person] :
      ( ( ( gets_rich @ A @ B )
        & ( C != B ) )
     => ! [D: $world] :
          ( ( $accessible_world @ A @ D )
         => ~ ( gets_rich @ D @ C ) ) ),
    file('LogicNX0MonoModal.p',one_rich) ).

thf(21,plain,
    ! [A: $world,B: person,C: person] :
      ( ( ( gets_rich @ A @ B )
        & ( C != B ) )
     => ! [D: $world] :
          ( ( $accessible_world @ A @ D )
         => ~ ( gets_rich @ D @ C ) ) ),
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[6]) ).

thf(22,plain,
    ! [D: $world,C: person,B: person,A: $world] :
      ( ~ ( gets_rich @ A @ B )
      | ( C = B )
      | ~ ( $accessible_world @ A @ D )
      | ~ ( gets_rich @ D @ C ) ),
    inference(cnf,[status(esa)],[21]) ).

thf(23,plain,
    ! [D: $world,C: person,B: person,A: $world] :
      ( ( C = B )
      | ~ ( gets_rich @ A @ B )
      | ~ ( $accessible_world @ A @ D )
      | ~ ( gets_rich @ D @ C ) ),
    inference(lifteq,[status(thm)],[22]) ).

thf(9,axiom,
    ! [A: $world,B: person] :
      ( B
     != ( advisor_of @ B ) ),
    file('LogicNX0MonoModal.p',no_self_advising) ).

thf(26,plain,
    ! [A: person] :
      ( A
     != ( advisor_of @ A ) ),
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[9]) ).

thf(27,plain,
    ~ ? [A: person] :
        ( A
        = ( advisor_of @ A ) ),
    inference(miniscope,[status(thm)],[26]) ).

thf(28,plain,
    ! [A: person] :
      ( A
     != ( advisor_of @ A ) ),
    inference(cnf,[status(esa)],[27]) ).

thf(29,plain,
    ! [A: person] :
      ( ( advisor_of @ A )
     != A ),
    inference(lifteq,[status(thm)],[28]) ).

thf(32,plain,
    ! [E: person,D: $world,C: person,B: person,A: $world] :
      ( ~ ( gets_rich @ A @ B )
      | ~ ( $accessible_world @ A @ D )
      | ~ ( gets_rich @ D @ C )
      | ( C != E )
      | ( B
       != ( advisor_of @ E ) ) ),
    inference(paramod_ordered,[status(thm)],[23,29]) ).

thf(33,plain,
    ! [D: person,C: $world,B: person,A: $world] :
      ( ~ ( gets_rich @ A @ ( advisor_of @ D ) )
      | ~ ( $accessible_world @ A @ C )
      | ~ ( gets_rich @ C @ B )
      | ( B != D ) ),
    inference(pattern_uni,[status(thm)],[32:[bind(A,$thf( A )),bind(B,$thf( advisor_of @ F )),bind(C,$thf( C )),bind(D,$thf( D )),bind(E,$thf( F ))]]) ).

thf(50,plain,
    ! [C: person,B: $world,A: $world] :
      ( ~ ( gets_rich @ A @ ( advisor_of @ C ) )
      | ~ ( $accessible_world @ A @ B )
      | ~ ( gets_rich @ B @ C ) ),
    inference(simp,[status(thm)],[33]) ).

thf(590,plain,
    ! [C: person,B: $world,A: $world] :
      ( ~ ( $accessible_world @ A @ B )
      | ~ ( gets_rich @ B @ C )
      | ( ( gets_rich @ ( sk1 @ alex @ $local_world ) @ ( advisor_of @ alex ) )
       != ( gets_rich @ A @ ( advisor_of @ C ) ) ) ),
    inference(paramod_ordered,[status(thm)],[584,50]) ).

thf(591,plain,
    ! [A: $world] :
      ( ~ ( $accessible_world @ ( sk1 @ alex @ $local_world ) @ A )
      | ~ ( gets_rich @ A @ alex ) ),
    inference(pattern_uni,[status(thm)],[590:[bind(A,$thf( sk1 @ alex @ $local_world )),bind(B,$thf( B )),bind(C,$thf( alex ))]]) ).

thf(631,plain,
    ! [A: $world] :
      ( ~ ( $accessible_world @ ( sk1 @ alex @ $local_world ) @ A )
      | ~ ( gets_rich @ A @ alex ) ),
    inference(simp,[status(thm)],[591]) ).

thf(732,plain,
    ! [B: $world,A: $world] :
      ( ~ ( gets_rich @ B @ alex )
      | ( ( $accessible_world @ A @ A )
       != ( $accessible_world @ ( sk1 @ alex @ $local_world ) @ B ) ) ),
    inference(paramod_ordered,[status(thm)],[13,631]) ).

thf(733,plain,
    ~ ( gets_rich @ ( sk1 @ alex @ $local_world ) @ alex ),
    inference(pattern_uni,[status(thm)],[732:[bind(A,$thf( sk1 @ alex @ $local_world )),bind(B,$thf( sk1 @ alex @ $local_world ))]]) ).

thf(772,plain,
    ~ $true,
    inference(rewrite,[status(thm)],[733,336]) ).

thf(773,plain,
    $false,
    inference(simp,[status(thm)],[772]) ).

% SZS output end Refutation for LogicNX0MonoModal.p
