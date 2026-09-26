class ValidationLibrary:

    def calculate_total(self, price, quantity):
        return float(price) * int(quantity)

    def validate_total(self, price, quantity, actual_total):
        expected = self.calculate_total(price, quantity)
        if expected != float(actual_total):
            raise AssertionError(
                f"Expected {expected}, but found {actual_total}"
            )
        return True

    def sum_totals(self, totals_list):
        """Adds up a list of per-row totals into one grand total."""
        return sum(float(t) for t in totals_list)