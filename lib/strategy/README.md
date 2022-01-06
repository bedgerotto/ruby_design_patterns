# DRAFT
The strategy pattern consists in pass an object as a parameter to a "base class". This base class is responsible to call the correct methods at the correct sequence over the received object.
The received object (AKA strategy) is responsible to implement the methods that'll be called from the base class