class Math
{
    function sqrt()
    {

    }

    function exp()
    {

    }
}

class DualNumbers
{
    // A.1 Dual Numbers

    var dual; // a_0
    var nondual; // a_e
    var dual_unit; // e

    // func: returns the dual conjugate (a_0 + e*a_e)
    function dual_conjugative() {
    return dual - (dual_unit * nondual);
    }

    // (A.1) lemma 6 - establishes dual conjugate behaves like the complex conjugate with respect to multiplication
    lemma multDualConjugate_lemma()
        // ensures  complex(conj(a) * conj(b)) == complex(conj(a)) * complex(conj(b))
            // **look into complex conjugative -> method/function??
    {
        // proof here
    }

    // (A.1) lemma 7 - inverse formula
    lemma inverse_lemma()
        requires dual != 0
    {
        // proof here
        // using equation 17
    }

    // function: returns the inverse of a dual number
    function inverse(): real
        requires dual != 0 // pure dual numbers (dual=0) do not have an inverse
        ensures inverse_lemma()
    {
        return (1/dual) - (dual_unit * (nondual / (dual * dual))); // = 1/(dual + dual_unit*nondual)
    }

    // (A.1) lemma 8 - sqrt formula
    lemma sqrt_lemma()
        requires dual > 0
    {
        // proof here
    }

    function sqrt(): real
        requires dual > 0
        ensures sqrt_lemma()
    {
        // sqrt = ^1/2
        return ;
    }
}