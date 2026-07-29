import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContextualityQuantumTheoryTheoremCanonicalLaneLean.ContextualityBridgeLemmas
import HautevilleHouse.ContextualityQuantumTheoryTheoremCanonicalLaneLean.ContextualityGateLemmas

namespace HautevilleHouse
namespace ContextualityQuantumTheoryTheoremCanonicalLaneLean

def ConstrainedContextualityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_contextuality_endgame (A : AdmissibleClass) :
    ConstrainedContextualityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContextualityQuantumTheoryTheoremCanonicalLaneLean
end HautevilleHouse