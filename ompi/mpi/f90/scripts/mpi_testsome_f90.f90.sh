#! /bin/sh

#
# Copyright (c) 2004-2006 The Trustees of Indiana University and Indiana
#                         University Research and Technology
#                         Corporation.  All rights reserved.
# Copyright (c) 2004-2005 The Regents of the University of California.
#                         All rights reserved.
# Copyright (c) 2006      Cisco Systems, Inc.  All rights reserved.
# $COPYRIGHT$
# 
# Additional copyrights may follow
# 
# $HEADER$
#

# This flie was not generated by XML scripts; it was written by hand.
# It may be generated someday, but at this point, it was simpler to
# just write it by hand.

. "$1/fortran_kinds.sh"

# This entire file is only generated in small or larger modules.  So
# if we're not at least small, bail now.

check_size small
if test "$output" = "0"; then
    exit 0
fi

# Ok, we should continue.

cat <<EOF

subroutine MPI_Testsome_normal(incount, array_of_requests, outcount, array_of_indices, array_of_statuses&
        , ierr)
  include 'mpif-config.h'
  integer, intent(in) :: incount
  integer, dimension(incount), intent(inout) :: array_of_requests
  integer, intent(out) :: outcount
  integer, dimension(*), intent(out) :: array_of_indices
  integer, dimension(incount, MPI_STATUS_SIZE), intent(inout) :: array_of_statuses
  integer, intent(out) :: ierr
  call MPI_Testsome(incount, array_of_requests, outcount, array_of_indices, array_of_statuses, ierr)
end subroutine MPI_Testsome_normal

subroutine MPI_Testsome_ignore(incount, array_of_requests, outcount, array_of_indices, array_of_statuses&
        , ierr)
! Note that we need mpif-common.h (not mpif-config.h) because we need
! the global common variable MPI_STATUSES_IGNORE
  include 'mpif-common.h'
  integer, intent(in) :: incount
  integer, dimension(incount), intent(inout) :: array_of_requests
  integer, intent(out) :: outcount
  integer, dimension(*), intent(out) :: array_of_indices
  double complex, intent(in) :: array_of_statuses
  integer, intent(out) :: ierr
  call MPI_Testsome(incount, array_of_requests, outcount, array_of_indices, MPI_STATUSES_IGNORE, ierr)
end subroutine MPI_Testsome_ignore

EOF
