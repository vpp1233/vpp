package com.vanphongpham.util;

import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ImageUpload {
	private static final String UPLOAD_DIRECTORY = "/images";
	private static final long MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
	
	public static String uploadImage(Part filePart, String uploadPath) throws IOException {
        String fileName = getFileName(filePart);

        if (fileName != null && !fileName.isEmpty()) {
            // Check file size
            if (filePart.getSize() > MAX_FILE_SIZE) {
                throw new IOException("File size exceeds the maximum limit of 10MB");
            }

            // Check file type
            String mimeType = filePart.getContentType();
            if (mimeType == null || !mimeType.startsWith("image/")) {
                throw new IOException("Invalid file type. Only image files are allowed.");
            }

            // Ensure the upload directory exists
            String absoluteUploadPath = uploadPath + File.separator + UPLOAD_DIRECTORY;
            File uploadsDir = new File(absoluteUploadPath);
            if (!uploadsDir.exists()) {
                uploadsDir.mkdirs();
            }

            File file = new File(uploadsDir, fileName);
            try (InputStream input = filePart.getInputStream();
                 FileOutputStream fos = new FileOutputStream(file)) {
                int bytesRead;
                byte[] buffer = new byte[1024];
                while ((bytesRead = input.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }
            // Return the relative path
            return "/views" + UPLOAD_DIRECTORY + "/" + fileName;
        }
        return null;
    }

    private static String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
