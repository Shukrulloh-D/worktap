import { RouterProvider } from 'react-router-dom';
import { ToastProvider } from 'shared/lib/toast';
import { AuthProvider } from 'shared/lib/auth';
import { router } from './router';
export const App = () => (
  <ToastProvider>
    <AuthProvider>
      <RouterProvider router={router} />
    </AuthProvider>
  </ToastProvider>
);
